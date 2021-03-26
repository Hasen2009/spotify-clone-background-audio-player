import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spotify2_app/data/models/track_model.dart';
class PlayerService {
  static Future<void> startPlayer() async {
    if(!AudioService.connected){
      await AudioService.connect();
    }
    // final List<Map<String, String>> list = [];
    //
    // for (var e in playlist) {
    //   list.add({
    //     'artist_name': e.artist_name,
    //     'album_name': e.album_name,
    //     'url': e.url,
    //     'image': e.image
    //   });
    // }

    await AudioService.start(
      backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
      // params: {'playlist': list},
    );
  }
  static Future<void> updatePlaylist(List<TrackModel> playlist) async {
    if(!AudioService.running){
      await PlayerService.startPlayer();
    }
    final List<Map<String, String>> list = [];

    for (var e in playlist) {
      list.add({
        'artist_name': e.artist_name,
        'album_name': e.album_name,
        'url': e.url,
        'image': e.image
      });
    }

    await AudioService.customAction('update',[list]);
  }
  static Future<void> play() async {
    //finish
    await AudioService.play();
  }

  static Future<void> pause() async {
    //finish
    await AudioService.pause();
  }

  static Future<void> stop() async {
    //finish
    await AudioService.stop();
  }

  static Future<void> dispose() async {
    //finish
    // await AudioService.stop();
    // await AudioService.disconnect();
  }

  static Future<void> skipNext() async {
    //finish
    await AudioService.skipToNext();
  }

  static Future<void> skipPrev() async {
    //finish
    await AudioService.skipToPrevious();
  }

  static Stream<SliderState> getCurrentMediaDurations() async* {
    // finish
    yield* Rx.combineLatest2<Duration, MediaItem, SliderState>(
      AudioService.positionStream,
      AudioService.currentMediaItemStream,
      (position, mediaItem) {
        return SliderState(position: position, mediaItem: mediaItem);
      },
    );
  }

  static Stream<Duration> getCurrentMediaPosition() async* {
    yield* AudioService.positionStream;
  }

  static Stream<PlaybackState> getPlayerStateStream() async* {
    // AudioService.playbackStateStream.listen((event) {
    //   print(event);
    // });
    yield* AudioService.playbackStateStream;
  }

  // static Stream<ProcessingState> getPlayerState() async* {
  //   yield* _player.processingStateStream;
  // }

  static Stream<CurrentIndexState> getPlayerCurrentIndexState() async* {
    yield* Rx.combineLatest2(
        AudioService.currentMediaItemStream,
        AudioService.playbackStateStream,
        (mediaItem, playerState) =>
            CurrentIndexState(mediaItem: mediaItem, playerState: playerState));
  }

  static seekTo(Duration position) async {
    await AudioService.seekTo(position);
  }

  static skipToTrack(String mediaId) async {
    await AudioService.skipToQueueItem(mediaId);
  }
}

class SliderState {
  final Duration position;
  final MediaItem mediaItem;

  SliderState({this.mediaItem, this.position});
}

class CurrentIndexState {
  final MediaItem mediaItem;
  final PlaybackState playerState;

  CurrentIndexState({this.mediaItem, this.playerState});
}

void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class AudioPlayerTask extends BackgroundAudioTask {
  static AudioPlayer _player;
  static List tracks = [];
  static List<MediaItem> mediaItems = [];

  @override
  Future onCustomAction(String name, arguments) async{
    if(!AudioService.connected){
      await AudioService.connect();
    }
    tracks = arguments[0];
    if(mediaItems.length > 0){
      mediaItems.clear();
    }
    for (var track in tracks) {
      mediaItems.add(
        MediaItem(
          id: track['url'],
          album: track['album_name'],
          title: track['artist_name'],
          duration: Duration(seconds: 29),
          artUri: track['image'],
        ),
      );
    }
    await AudioService.updateQueue(mediaItems);
    await AudioService.skipToQueueItem(mediaItems[0].id);
    AudioService.play();
  }
  @override
  Future<void> onUpdateQueue(List<MediaItem> queue) async{


    await _player.setAudioSource(
      ConcatenatingAudioSource(
        // Start loading next item just before reaching it.
        useLazyPreparation: true, // default
        // Customise the shuffle algorithm.
        shuffleOrder: DefaultShuffleOrder(), // default
        // Specify the items in the playlist.
        children: queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
      ),
      // Playback will be prepared to start from track1.mp3
      initialIndex: 0, // default
      // Playback will be prepared to start from position zero.
      initialPosition: Duration.zero, // default
    );
    if(AudioServiceBackground.queue != null){
      AudioServiceBackground.queue.clear();
    }
    await AudioServiceBackground.setQueue(queue);
  }
  @override
  Future<void> onStart(Map<String, dynamic> params) async {

    _player = AudioPlayer();
    // List<AudioSource> playlistUrls = [];
    // tracks = params['playlist'];
    //
    // for (var track in tracks) {
    //   playlistUrls.add(AudioSource.uri(Uri.parse(track['url'])));
    //   mediaItems.add(
    //     MediaItem(
    //       id: track['url'],
    //       album: track['album_name'],
    //       title: track['artist_name'],
    //       duration: Duration(seconds: 29),
    //       artUri: track['image'],
    //     ),
    //   );
    // }
    // await _player.setAudioSource(
    //   ConcatenatingAudioSource(
    //     // Start loading next item just before reaching it.
    //     useLazyPreparation: true, // default
    //     // Customise the shuffle algorithm.
    //     shuffleOrder: DefaultShuffleOrder(), // default
    //     // Specify the items in the playlist.
    //     children: playlistUrls,
    //   ),
    //   // Playback will be prepared to start from track1.mp3
    //   initialIndex: 0, // default
    //   // Playback will be prepared to start from position zero.
    //   initialPosition: Duration.zero, // default
    // );
    // await AudioServiceBackground.setQueue(mediaItems);
    _player.currentIndexStream.listen((index) async {
      if (index == null) return;
      await AudioServiceBackground.setMediaItem(mediaItems[index]);
    });
    _player.playbackEventStream.listen((event) {
      _broadcastState();
    });

    // await onPlay();
  }
  Future<void> _broadcastState() async {
    await AudioServiceBackground.setState(
      controls: [
        MediaControl.skipToPrevious,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.skipToNext,
      ],
      systemActions: [
        MediaAction.seekTo,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      ],
      androidCompactActions: [0, 1, 3],
      processingState: _getProcessingState(),
      playing: _player.playing,
      position: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
    );
  }

  AudioProcessingState _getProcessingState() {
    switch (_player.processingState) {
      case ProcessingState.idle:
        return AudioProcessingState.stopped;
      case ProcessingState.loading:
        return AudioProcessingState.connecting;
      case ProcessingState.buffering:
        return AudioProcessingState.buffering;
      case ProcessingState.ready:
        return AudioProcessingState.ready;
      case ProcessingState.completed:
        return AudioProcessingState.completed;
      default:
        throw Exception("Invalid state: ${_player.processingState}");
    }
  }

  @override
  Future<void> onStop() async {

    // await _player.dispose();
    await _broadcastState();
    await AudioServiceBackground.setState(
      controls: [],
      processingState: AudioProcessingState.stopped,
      playing: false,
    );
    await super.onStop();
  }

  @override
  Future<void> onPause() async {
    await _player.pause();
    if (!_player.playing) {
      await AudioServiceBackground.setState(
        controls: [MediaControl.play, MediaControl.stop],
        processingState: AudioProcessingState.ready,
        playing: false,
      );
    }
  }

  @override
  Future<void> onPlay() async {
    await _player.play();
    if (_player.playing) {
      await AudioServiceBackground.setState(
        controls: [MediaControl.pause, MediaControl.stop],
        processingState: AudioProcessingState.ready,
        playing: false,
      );
    }
  }

  @override
  Future<void> onSkipToQueueItem(String mediaId) async {
    final newIndex = mediaItems.indexWhere((item) => item.id == mediaId);
    await AudioServiceBackground.setMediaItem(mediaItems[newIndex]);

    await _player.seek(Duration(seconds: 0), index: newIndex);
    onPlay();

  }

  @override
  Future<void> onSeekTo(Duration position) async {
    await _player.seek(position);
  }

  @override
  Future<void> onClose() async {
    await onStop();
    await _player.dispose();
    tracks = [];
    mediaItems = [];
    return super.onClose();
  }
}

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spotify2_app/data/models/track_model.dart';

class PlayerService {
  static AudioPlayer _player;

  static List<TrackModel> tracks = [];

  static Future<void> setPlaylist(List<TrackModel> playlist) async {
    AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint,params: {
      'playlist' :  playlist
    });
    // _player = AudioPlayer();
    // List<AudioSource> playlistUrls = [];
    // tracks = playlist;
    // for (var track in tracks) {
    //   playlistUrls.add(AudioSource.uri(Uri.parse(track.url)));
    // }
    //  await _player.setAudioSource(
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
    //
    // if (!_player.playing) {
    //   PlayerService.play();
    // }
  }

  static Future<void> play() async {
    await _player.play();
    print('_player.currentIndex');
    print(_player.currentIndex);
  }

  static Future<void> pause() async {
    await _player.pause();
  }

  static Future<void> stop() async {
    await _player.stop();
  }

  static Future<void> dispose() async {
    await _player.stop();
    print('stopped');
    await _player.dispose();

    print('disposed');
  }

  static Future<void> skipNext() async {
    await _player.seekToNext();
  }

  static Future<void> skipPrev() async {
    await _player.seekToPrevious();
  }

  static Stream<SliderState> getCurrentMediaDurations() async* {
    yield* Rx.combineLatest2<Duration, Duration, SliderState>(
      _player?.positionStream,
      _player?.durationStream,
      (position, duration) {
        return SliderState(position: position, duration: duration);
      },
    );
  }

  static Stream<Duration> getCurrentMediaPosition() async* {
    yield* _player?.positionStream;
  }

  static Stream<PlayerState> getPlayerStateStream() async* {
    yield* _player.playerStateStream;
  }

  static Stream<ProcessingState> getPlayerState() async* {
    yield* _player.processingStateStream;
  }

  static Stream<CurrentIndexState> getPlayerCurrentIndexState() async* {
    yield* Rx.combineLatest2(_player.currentIndexStream, _player.playerStateStream, (index, playerState) => CurrentIndexState(index: index,playerState: playerState));
  }

  static seekTo(Duration position) async {
    await _player.seek(position);
  }

  static TrackModel getCurrentTrack(int index) {
    return tracks[index];
  }

  static skipToTrack(int index) async {
    await _player.seek(Duration(seconds: 0), index: index);
    await play();
  }
}

class SliderState {
  final Duration position;
  final Duration duration;

  SliderState({this.duration, this.position});
}

class CurrentIndexState {
  final int index;
  final PlayerState playerState;

  CurrentIndexState({this.index, this.playerState});
}

_backgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => AudioPlayerTask());
}
class AudioPlayerTask extends BackgroundAudioTask {
  static AudioPlayer _player;

  static List<TrackModel> tracks = [];
  @override
  Future<void> onStart(Map<String, dynamic> params) async{

    _player = AudioPlayer();
    List<AudioSource> playlistUrls = [];
    tracks = params['playlist'];
    for (var track in tracks) {
      playlistUrls.add(AudioSource.uri(Uri.parse(track.url)));
    }
    await _player.setAudioSource(
      ConcatenatingAudioSource(
        // Start loading next item just before reaching it.
        useLazyPreparation: true, // default
        // Customise the shuffle algorithm.
        shuffleOrder: DefaultShuffleOrder(), // default
        // Specify the items in the playlist.
        children: playlistUrls,
      ),
      // Playback will be prepared to start from track1.mp3
      initialIndex: 0, // default
      // Playback will be prepared to start from position zero.
      initialPosition: Duration.zero, // default
    );

    if (!_player.playing) {
      PlayerService.play();
    }
    return super.onStart(params);
  }
}
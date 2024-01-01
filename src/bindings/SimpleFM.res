module Types = {
  type track = {"artist": {"name": string}, "url": string, "name": string}
  type recentTracksRes = {"search": {"nowPlaying": bool}, "tracks": array<track>}

  type user = {getRecentTracks: {"username": string} => promise<recentTracksRes>}
}

type simpleFM = {user: Types.user}

@module("@solely/simple-fm") @new external simpleFm: (~key: string) => simpleFM = "default"

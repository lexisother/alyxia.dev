<script setup lang="ts">
import SimpleFMClient from "@solely/simple-fm";
import { ref } from "vue";
import { timeAgo } from "../util";

let loading = ref(true);

// Don't care, didn't ask, token gets exposed in network request anyways.
let client = new SimpleFMClient("64346b97f7b9f6b97f29b37e3e1c521c");

let data = await client.user.getRecentTracks({ username: "lexisother" });
loading.value = false;

let playing = data.search.nowPlaying;
let latest = data.tracks[0]!;
</script>

<template>
  <div v-if="loading">loading lastfm data...</div>
  <div v-else>
    <h1>{{ playing ? "now playing!" : "last played" }}</h1>
    <br />
    <blockquote>
      <a :href="latest.url!">{{ latest.artist?.name }} - {{ latest.name }}</a>
      <br />
      <span v-if="!playing">{{ timeAgo(latest.dateAdded!) }}</span>
    </blockquote>
  </div>
</template>

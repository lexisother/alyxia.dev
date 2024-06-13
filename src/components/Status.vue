<script setup lang="ts">
import { useFetch } from "@vueuse/core";

const { isFetching, data } = await useFetch(
  "https://status.cafe/users/alyxia/status.json"
).json();
</script>

<template>
  <div v-if="isFetching">loading status...</div>
  <div v-else>
    <h1>latest status</h1>
    <br />
    <blockquote>
      <div class="status-meta">
        <a href="https://status.cafe/users/alyxia">alyxia</a>
        <span>{{ data.face }}</span>
        <span class="subtle">{{ data.timeAgo }}</span>
      </div>
      <div v-html="data.content"></div>
    </blockquote>
  </div>
</template>

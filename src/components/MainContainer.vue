<script setup lang="ts">
import Header from "../components/Header.vue";

import selfBadge from "/static/img/88x31/self.png?url";
</script>

<template>
  <div class="container">
    <Header />
    <main>
      <slot />
    </main>
    <footer>
      <img :src="selfBadge" />
      {{ " " }}
      <span>♥</span>
      {{ " " }}
      <a
        href="https://github.com/lexisother/alyxia.dev"
        target="_blank"
        rel="noopener nofollow"
        >source code</a
      >
    </footer>
  </div>
</template>

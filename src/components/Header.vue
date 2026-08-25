<script setup lang="ts">
import xmark from "/static/img/xmark-solid.svg?url";
import aly from "/static/img/aly.png?url";
import { nav as hnavs } from "../../data/data.json";
import { useToggle } from "@vueuse/core";

let [opened, toggleOpen] = useToggle(false);
const IS_DEV = import.meta.env.DEV;
</script>

<template>
  <header :class="opened ? 'open' : ''">
    <button @click="toggleOpen()">
      <img :src="xmark" />
    </button>
    <div class="h-card">
      <img class="u-photo" :src="aly" width="48" height="48" />
      <a class="p-name p-author u-url" href="/">alyxia</a>
    </div>
    <nav>
      <template v-for="hnav in hnavs">
        <p>
          <i class="emoji" aria-hidden="true">{{ hnav.emoji }}</i>
          {{ hnav.name }}
        </p>
        <ul>
          <li v-for="nav in hnav.links">
            <a :href="nav.link">
              <i class="emoji" aria-hidden="true">{{ nav.emoji }}</i>
              {{ nav.name }}
            </a>
          </li>
        </ul>
      </template>

      <div class="webrings">
        <script
          v-if="!IS_DEV"
          src="https://transring.neocities.org/ring.js"
          data-widget="cloud"
        ></script>

        <div class="badge app-icon-ring">
          <a class="app-icon-ring-home" href="https://ring.basil.cafe">
            <img width="88" height="31" src="https://ring.basil.cafe/images/88x31-nav/button.webp" alt="App Icon webring" />
          </a>

          <a class="app-icon-ring-arrow app-icon-ring-previous" href="https://ring.basil.cafe/prev?id=alyxia" aria-label="Previous site">
            <img width="16" height="31" src="https://ring.basil.cafe/images/88x31-nav/left-hover.webp" alt="" />
            <img width="16" height="31" src="https://ring.basil.cafe/images/88x31-nav/left-active.webp" alt="" />
          </a>

          <a class="app-icon-ring-arrow app-icon-ring-next" href="https://ring.basil.cafe/next?id=alyxia" aria-label="Next site">
            <img width="16" height="31" src="https://ring.basil.cafe/images/88x31-nav/right-hover.webp" alt="" />
            <img width="16" height="31" src="https://ring.basil.cafe/images/88x31-nav/right-active.webp" alt="" />
          </a>
        </div>
      </div>
    </nav>
  </header>
</template>

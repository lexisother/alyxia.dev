<script setup lang="ts">
import xmark from "/static/img/xmark-solid.svg?url";
import aly from "/static/img/aly.png?url";
import { nav as hnavs } from "../../data/data.json";
import { useToggle } from "@vueuse/core";

let [opened, toggleOpen] = useToggle(false);
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
            <i class="emoji" aria-hidden="true">{{ nav.emoji }}</i>
            <a :href="nav.link">{{ nav.name }}</a>
          </li>
        </ul>
      </template>
      <script src="https://transring.neocities.org/ring.js" data-widget="cloud"></script>
    </nav>
  </header>
</template>

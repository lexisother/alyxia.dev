import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';
import node from '@astrojs/node';

import vue from "@astrojs/vue";

// https://astro.build/config
export default defineConfig({
  output: 'server',
  adapter: node({ mode: 'standalone' }),
  site: import.meta.env.PROD ? 'https://alyxia.dev' : 'http://localhost:4321',
  integrations: [mdx(), sitemap(), vue()]
});
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

import vue from "@astrojs/vue";

// https://astro.build/config
export default defineConfig({
  site: import.meta.env.PROD ? 'https://alyxia.dev' : 'http://localhost:4321',
  integrations: [mdx(), sitemap(), vue()]
});
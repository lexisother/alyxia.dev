import rss, { type RSSFeedItem } from "@astrojs/rss";
import { getCollection } from "astro:content";
import type { APIContext } from "astro";
import { getContainerRenderer } from "@astrojs/mdx";
import { loadRenderers } from "astro:container";
import { experimental_AstroContainer as AstroContainer } from "astro/container";

import { transform, walk } from "ultrahtml";
import sanitize from "ultrahtml/transformers/sanitize";

import RSSRenderer from "../../components/RSSRenderer.astro";

export async function fixLinks(html: string, baseUrl: string) {
  return await transform(html, [
    async (node) => {
      await walk(node, (node) => {
        if (node.name === "a" && node.attributes.href?.startsWith("/")) {
          node.attributes.href = baseUrl + node.attributes.href;
        }
        if (node.name === "img" && node.attributes.src?.startsWith("/")) {
          node.attributes.src = baseUrl + node.attributes.src;
        }
      });
      return node;
    },

    sanitize({ dropElements: ["script", "style"] })
  ]);
}

export async function GET(context: APIContext) {
  let baseUrl = import.meta.env.PROD ? 'https://alyxia.dev' : 'http://localhost:4321';
  if (baseUrl.at(-1) === '/') baseUrl = baseUrl.slice(0, -1);
  const blog = await getCollection("blog");
  const items: RSSFeedItem[] = [];
  const renderers = await loadRenderers([getContainerRenderer()]);
  const container = await AstroContainer.create({
    renderers
  });


  for (const post of blog) {
    let html = await container.renderToString(RSSRenderer, {
      params: { id: post.slug }
    });
    html = await fixLinks(html, baseUrl);

    items.push({
      title: post.data.title,
      pubDate: new Date(post.data.created),
      link: baseUrl + `/blog/${post.slug}`,
      content: html
    });
  }

  return await rss({
    title: "alyxia.dev",
    description: "a blog with insignificant contents",
    site: context.site!,
    items
  });
}
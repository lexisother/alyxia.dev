import type { APIRoute } from "astro";
import { getCollection } from "astro:content";

import { getContainerRenderer } from "@astrojs/mdx";
import { loadRenderers } from "astro:container";

import { experimental_AstroContainer as AstroContainer } from "astro/container";
import { transform, walk } from "ultrahtml";
import rss from "@astrojs/rss";
import sanitize from "ultrahtml/transformers/sanitize";

import RSSRenderer from "../../components/RSSRenderer.astro";

export const GET: APIRoute = async () => {
  let baseUrl = import.meta.env.PROD
    ? "https://alyxia.dev"
    : "http://localhost:4321";
  if (baseUrl.at(-1) === "/") baseUrl = baseUrl.slice(0, -1);

  const posts = await getCollection("blog");

  const items = [];
  const container = await AstroContainer.create({
    renderers: await loadRenderers([getContainerRenderer()]),
  });

  for (const post of posts) {
    const html = await container.renderToString(RSSRenderer, {
      params: { slug: post.slug },
    });

    const sanitized = await transform(html, [
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
      sanitize({ dropElements: ["script", "style"] }),
    ]);

    items.push({
      title: post.data.title,
      pubDate: new Date(post.data.created),
      link: `/blog/${post.slug}`,
      content: sanitized,
    });
  }

  return await rss({
    title: "alyxia.dev",
    description: "a blog with insignificant contents",
    site: import.meta.env.SITE,
    items,
  });
};

import { defineCollection } from "astro:content";
import { glob } from "astro/loaders";
import { z } from "astro/zod";

const blog = defineCollection({
  loader: glob({ base: './src/content/blog', pattern: '**/*.{md,mdx}' }),
  schema: z.object({
    title: z.string(),
    draft: z.boolean().optional().default(false),
    created: z.string().or(z.date()),
    modified: z.string().or(z.date()).optional(),
  }),
});

export const collections = { blog };

import { defineCollection, z } from "astro:content";

const blog = defineCollection({
  schema: z.object({
    title: z.string(),
    draft: z.boolean().optional().default(false),
    created: z.string().or(z.date()),
    modified: z.string().or(z.date()).optional(),
  }),
});

export const collections = { blog };

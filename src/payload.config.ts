import { buildConfig } from "payload/config";
import path from "path";
import Categories from "./collections/Categories";
import Posts from "./collections/Posts";
import Tags from "./collections/Tags";
import Users from "./collections/Users";
import Media from "./collections/Media";
import { gcsAdapter } from "@payloadcms/plugin-cloud-storage/gcs";
import { cloudStorage } from "@payloadcms/plugin-cloud-storage";

let adapter = gcsAdapter({
  options: {
    // apiEndpoint: process.env.GCS_ENDPOINT,
    projectId: process.env.GCS_PROJECT_ID,
  },
  bucket: process.env.GCS_BUCKET,
});

const serverURL = process.env.PAYLOAD_PUBLIC_PAYLOAD_URL ||
  "http://localhost:3000";

export default buildConfig({
  serverURL,
  admin: {
    user: Users.slug,
  },

  collections: [
    Categories,
    Posts,
    Tags,
    Users,
    Media,
  ],
  plugins: [
    cloudStorage({
      collections: {
        media: {
          adapter,
        },
      },
    }),
  ],
  typescript: {
    outputFile: path.resolve(__dirname, "payload-types.ts"),
  },
  graphQL: {
    schemaOutputFile: path.resolve(__dirname, "generated-schema.graphql"),
  },
});

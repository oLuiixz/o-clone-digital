import { gunzipSync } from "node:zlib";
import part1 from "./course-data-part-1";
import part2 from "./course-data-part-2";
import part3 from "./course-data-part-3";
import part4 from "./course-data-part-4";
import part5 from "./course-data-part-5";

const compressed = part1 + part2 + part3 + part4 + part5;
export const ecommerceCourseModules = JSON.parse(
  gunzipSync(Buffer.from(compressed, "base64")).toString("utf8")
);

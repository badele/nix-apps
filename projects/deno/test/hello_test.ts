import { assertEquals } from "https://deno.land/std@0.202.0/assert/mod.ts";
import { concat } from "../hello.ts";

Deno.test("Testing concatenation", () => {
  const title = "title";
  const mess = "mess";

  assertEquals(concat(title, mess), `${title} ${mess}`);
  assertEquals(concat(title, " "), `${title}`);
});

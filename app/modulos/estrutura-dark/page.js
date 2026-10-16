import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../lib/member-auth";
import EstruturaDarkClient from "./EstruturaDarkClient";
import parte1 from "./data/1.json";
import parte2 from "./data/2.json";
import parte3 from "./data/3.json";
import parte4 from "./data/4.json";
import parte5 from "./data/5.json";
import parte6 from "./data/6.json";

export const dynamic = "force-dynamic";

export default async function EstruturaDarkPage() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");
  return <EstruturaDarkClient lessons={[...parte1, ...parte2, ...parte3, ...parte4, ...parte5, ...parte6]} />;
}

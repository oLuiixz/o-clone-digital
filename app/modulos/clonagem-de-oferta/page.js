import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../lib/member-auth";
import ClonagemOfertaClient from "./ClonagemOfertaClient";
export const dynamic = "force-dynamic";
export default async function ClonagemOfertaPage() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");
  return <ClonagemOfertaClient />;
}

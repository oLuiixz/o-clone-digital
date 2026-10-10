import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../lib/member-auth";
import IntegracaoEntregaClientPage from "./ClientPage";

export const dynamic = "force-dynamic";

export default async function IntegracaoEntregaPage() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");
  return <IntegracaoEntregaClientPage />;
}

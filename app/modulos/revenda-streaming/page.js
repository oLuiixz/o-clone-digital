import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../lib/member-auth";
import RevendaStreamingClient from "./RevendaStreamingClient";

export const dynamic = "force-dynamic";

export default async function RevendaStreamingPage() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");
  return <RevendaStreamingClient />;
}

import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../../lib/member-auth";
import PromptsClient from "../prompts/PromptsClient";
export const dynamic = "force-dynamic";
export default async function PromptsPage(){ const member=await getCurrentMember(); if(!member) redirect("/login"); return <PromptsClient />; }

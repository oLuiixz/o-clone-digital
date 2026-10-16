import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../../lib/member-auth";
import ConteudoValidadoClient from "./ConteudoValidadoClient";
export const dynamic = "force-dynamic";
export default async function ConteudoValidadoPage(){ const member=await getCurrentMember(); if(!member) redirect("/login"); return <ConteudoValidadoClient />; }

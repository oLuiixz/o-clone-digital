import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../lib/member-auth";
import VibeCodingClient from "./VibeCodingClient";
export const dynamic = "force-dynamic";
export default async function VibeCodingPage(){const member=await getCurrentMember();if(!member)redirect("/login");return <VibeCodingClient/>;}
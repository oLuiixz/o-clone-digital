import {redirect} from "next/navigation";
import {getCurrentMember} from "../../../lib/member-auth";
import OrganicoClient from "../organico/OrganicoClient";
export const dynamic="force-dynamic";
export default async function TikTokOrganicoPage(){const member=await getCurrentMember();if(!member)redirect("/login");return <OrganicoClient kind="tiktok"/>;}
import { redirect } from "next/navigation";
import { getCurrentMember } from "../../lib/member-auth";
import CommunityChat from "./CommunityChat";
import CommunityVoiceRooms from "./CommunityVoiceRooms";

export const dynamic = "force-dynamic";

export default async function CommunityPage() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");
  return <main className="community-page">
    <header className="community-heading">
      <div><div className="community-eyebrow"><span /> ESPAÇO DOS MEMBROS</div><h1>Comunidade<span>.</span></h1><p>Troque experiências, compartilhe aprendizados e converse com outros membros.</p></div>
      <a className="community-back" href="/painel">Voltar ao painel <span>↗</span></a>
    </header>
    <CommunityVoiceRooms />
    <CommunityChat currentMemberId={member.id} />
  </main>;
}

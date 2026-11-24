import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../../../lib/member-auth";
import EcommerceCourseExperience from "../EcommerceCourseExperience";
import { ecommerceCourseModules } from "../course-data";

export const dynamic = "force-dynamic";

export default async function TrabalheComEcommercePage() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");

  return <EcommerceCourseExperience modules={ecommerceCourseModules} />;
}

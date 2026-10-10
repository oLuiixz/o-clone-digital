import ActivateForm from "./ActivateForm";

export default async function ActivatePage({ searchParams }) {
  const params = await searchParams;
  return <ActivateForm token={typeof params?.token === "string" ? params.token : ""} />;
}

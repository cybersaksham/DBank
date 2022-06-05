import { dbank } from "../../declarations/dbank";

const refreshAmount = async () => {
  const currentAmt = await dbank.checkBalance();
  document.getElementById("value").innerText =
    Math.round(currentAmt * 100) / 100;
};

const resetForm = () => {
  document.querySelector("form").reset();
};

window.addEventListener("load", async () => {
  await refreshAmount();
  await dbank.compound();
  await refreshAmount();
});

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();

  const button = e.target.querySelector("#submit-btn");

  const topupAmt = document.getElementById("topup-amount").value;
  const withdrawAmt = document.getElementById("withdraw-amount").value;

  button.setAttribute("disabled", true);

  if (topupAmt.length != 0) {
    await dbank.topUp(parseFloat(topupAmt));
  }
  if (withdrawAmt.length != 0) {
    await dbank.withdraw(parseFloat(withdrawAmt));
  }
  await refreshAmount();

  button.removeAttribute("disabled");
  resetForm();
});

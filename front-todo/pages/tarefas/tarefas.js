document.addEventListener("DOMContentLoaded", async function () {
  const API_URL = "http://127.0.0.1:3000/tarefas";
  const tbody = document.getElementById("tarefas-body");

  try {
    const response = await fetch(API_URL);
    const tarefas = await response.json();

    tbody.innerHTML = "";

    tarefas.forEach((tarefa) => {
      const tr = document.createElement("tr");

      const td_nome = document.createElement("td");
      td_nome.textContent = tarefa.nome;

      const td_descricao = document.createElement("td");
      td_descricao.textContent = tarefa.descricao;

      const td_status = document.createElement("td");
      td_status.innerHTML = tarefa.finalizada
        ? '<span class="badge rounded-pill bg-success">Concluída</span>'
        : '<span class="badge rounded-pill bg-secondary">A fazer</span>';

      tr.appendChild(td_nome);
      tr.appendChild(td_descricao);
      tr.appendChild(td_status);

      tr.classList.add("clickable-row");
      tr.addEventListener("click", function () {
        const modalTarefaNome = document.getElementById("modal-tarefa-nome");
        const modalTarefaDescricao = document.getElementById(
          "modal-tarefa-descricao"
        );
        const modalTarefaFinalizada = document.getElementById(
          "modal-tarefa-finalizada"
        );

        modalTarefaNome.textContent = `${tarefa.nome}`;
        modalTarefaDescricao.textContent = `${tarefa.descricao}`;
        modalTarefaFinalizada.textContent = `${
          tarefa.finalizada ? "Sim" : "Não"
        }`;

        const modal = new bootstrap.Modal(document.getElementById("myModal"));
        modal.show();
      });

      tbody.appendChild(tr);
    });
  } catch (error) {
    console.error("Erro ao buscar as tarefas:", error);
  }
});

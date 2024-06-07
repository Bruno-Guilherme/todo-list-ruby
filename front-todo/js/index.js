const API_URL = "http://127.0.0.1:3000/tarefas";

const buscarTarefas = async () => {
  try {
    const response = await fetch(API_URL);
    const tarefas = await response.json();

  } catch (error) {}
};

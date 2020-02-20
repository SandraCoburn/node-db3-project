const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

function find() {
  return db("schemes");
}

function findById(id) {
  if (id) {
    return db("schemes")
      .where({ id })
      .first();
  } else return null;
}
function findSteps(id) {
  return db("steps as s")
    .join("schemes as sc", "s.scheme_id", "sc.id")
    .select("s.id", "sc.scheme_name", "s.step_number", "s.instructions")
    .where("sc.id", id);
}
async function add(scheme) {
  const [id] = await db("schemes").insert(scheme);
  return findById(id);
}
function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes, "*");
}
function remove(id) {
  return db("schemes")
    .where({ id })
    .del();
}

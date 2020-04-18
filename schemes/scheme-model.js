const db = require("../data/dbConfig");

function find() {
    return db("schemes");
}

function findById(id) {
    return db("schemes").where({ id }).first();
}

function findSteps(id) {
    return db
        .select("scheme_name", "steps.step_number", "steps.instructions")
        .from("schemes")
        .where({ "schemes.id": id })
        .orderBy("steps.step_number", "asc")
        .innerJoin("steps", "schemes.id", "steps.scheme_id");
}

function add(scheme) {
    return db("schemes").insert(scheme);
}

function update(changes, id) {
    return db("schemes").where({ id }).update(changes);
}

function remove(id) {
    return db("schemes").where({ id }).del();
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
};

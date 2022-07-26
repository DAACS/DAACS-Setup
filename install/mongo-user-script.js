use daacsdb
db.createUser(
  {
    user: "admin",
    pwd: "admin@daacs",
    roles: [ { role: "readWrite", db: "daacsdb" },
             { role: "dbAdmin", db: "daacsdb"}]
  }
)

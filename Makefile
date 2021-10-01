postgres:
	 docker run --name postgres13 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=kaak -d postgres:13-alpine
createdb:
	winpty docker exec -it postgres13 createdb --username=root --owner=root simple_bank
dropdb:
	winpty docker exec -it postgres13  dropdb --username=root --owner=root simple_bank
migrateup:
	migrate -path db/migration -database "postgresql://root:kaak@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:kaak@localhost:5432/simple_bank?sslmode=disable" -verbose down
sqlc:
	sqlc generate
test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/iKayrat/simplebank/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migratedown sqlc server mock
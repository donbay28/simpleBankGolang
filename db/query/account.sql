-- name: CreateAccount :one
INSERT INTO account (
  owner, 
  balance,
  currencry
) VALUES (
  $1, $2, $3
)  RETURNING *;

-- name: GetAccount :one
SELECT * FROM account
WHERE id_account = $1 LIMIT 1;

-- name: ListAccount :many
SELECT * FROM account
ORDER BY id_account LIMIT $1 OFFSET $2;

-- name: UpdateAccount :one
UPDATE account SET balance = $2
WHERE id_account = $1
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM account WHERE id_account = $1;
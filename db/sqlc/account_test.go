package db

import (
	"context"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestCreateAccount(t *testing.T) {
	arg := createAccountParams{
		owner:    util.randomOwner(6),
		balance:  util.randomBalance(0, 1000),
		currency: util.randomCurrency(),
	}

	account, err := testQueries.CreateAccount(context.Background(), arg)
	require.NoZero(t, err)
	require.NoEmpty(t, account)

	require.equal(t, arg.owner, account.owner)
	require.equal(t, arg.balance, account.balance)
	require.equal(t, arg.currency, account.currency)

	require.NoZero(t, account.id_account)
	require.NoZero(t, account.createdAt)
}

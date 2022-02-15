package api

import (
	"os"
	"testing"

	"github.com/gin-gonic/gin"
)

// func newTestServer(t *testing.T, store db.Store) *Server {
// 	config := util.Config{
// 		DBDriver:      "",
// 		DBSource:      "",
// 		ServerAddress: "",
// 	}

// 	server, err := NewServer(config, store)
// 	require.NoError(t, err)

// 	return server
// }

func TestMain(m *testing.M) {
	gin.SetMode(gin.TestMode)

	os.Exit(m.Run())
}

module RPS_IO

import Effects
import Ethereum.IO
import RPS

namespace Main
  main : IO ()
  main = do
    --runInit [()] (init)
    res <- runInit [(), MkEth 10 0 0 0, MkEnv 0x1 0x2 0x2] (playerChoice 0)
    putStrLn . show $ res


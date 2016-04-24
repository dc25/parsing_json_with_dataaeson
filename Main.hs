{-# LANGUAGE DeriveGeneric #-}

import Data.ByteString.Lazy as BSL (readFile)
import Data.Text (Text)
import Data.Aeson (FromJSON, decode)
import Data.Map (Map, toList, map)
import GHC.Generics (Generic)

-- Record representing a single referrer
data Ref = Ref (Map Text Int) deriving (Show, Generic)

instance FromJSON Ref

main :: IO()
main = do
    inh <- BSL.readFile "json.txt" 
    case decode inh :: Maybe (Map Text Ref) of
        Just parsed -> print parsed
        Nothing -> print "Unparsable"

{-#LANGUAGE ForeignFunctionInterface#-}
{-#LANGUAGE RankNTypes#-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Bindings.Verba.FFI
-- Copyright   :  (c) Macil 2014
-- License     :  PublicDomain
-- 
-- Maintainer  :  Macil.dev@gmail.com
-- Stability   :  experimental
-- Portability :  unportable
--
-- FFI interface
--
-----------------------------------------------------------------------------
module Bindings.Verba.C.FFI where

import Bindings.Verba.C.Types

import Foreign
import Foreign.C
-- * Library initialization
-- | CryptoInit
foreign import stdcall "CryptoInit" c_CryptoInit :: CString -- ^ Path to secret keys storage
                                                 -> CString -- ^ Path to open keys storage
                                                 -> IO Word16
-- | SignInit
foreign import stdcall "SignInit"   c_SignInit   :: CString -- ^ Path to secret keys storage
                                                 -> CString -- ^ Path to open  keys storage
                                                 -> IO Word16

-- | CryptoDone
foreign import stdcall "CryptoDone" c_CryptoDone :: IO Word16
-- | SignDone
foreign import stdcall "SignDone"   c_SignDone   :: IO Word16

-- * Encryption
-- | EnCryptFile
foreign import stdcall "EnCryptFile" c_EnCryptFile :: CString     -- ^ Source filename
                                                   -> CString     -- ^ Destination filename
                                                   -> Word16      -- ^ Sender key id
                                                   -> Ptr Word16  -- ^ Receivers key ids
                                                   -> CString     -- ^ Key series
                                                   -> IO Word16
-- | DeCryptFile
foreign import stdcall "DeCryptFile" c_DeCryptFile :: CString    -- ^ Source filename
                                                   -> CString    -- ^ Destination filename
                                                   -> Word16     -- ^ Key id
                                                   -> IO Word16
-- * Signing
-- | SignFile
foreign import stdcall "SignFile" c_SignFile :: CString   -- ^ Source filename
                                             -> CString   -- ^ Destination filename
                                             -> CString   -- ^ Key id
                                             -> IO Word16
-- | check_file_sign
foreign import stdcall "check_file_sign" c_check_file_sign :: CString     -- ^ Signed filename
                                                           -> Ptr Word8   -- ^ Size of result
                                                           -> Ptr (Ptr C_Check_Status) -- ^ Result
                                                           -> IO Word16
-- | DelSign
foreign import stdcall "DelSign" c_DelSign :: CString   -- ^ Signed filename
                                           -> Word8     -- ^ Number of signatires to remove (-1 to remove all)
                                           -> IO Word16

-- * Miscellaneous
-- | GetDrvInfo
foreign import stdcall "GetDrvInfo" c_GetDrvInfo :: Ptr C_USR_KEYS_INFO  -- ^ Result
                                                 -> Ptr Word32           -- ^ Size of result
                                                 -> IO Word16
-- | GetFileSenderId
foreign import stdcall "GetFileSenderID" c_GetFileSenderId :: CString    -- ^ Encrypted filename
                                                           -> CString    -- ^ Result
                                                           -> IO Word16
-- | GetCryptKeysF
foreign import stdcall "GetCryptKeysF" c_GetCryptKeysF :: CString           -- ^ Encrypted filename
                                                       -> Ptr Word16        -- ^ Size of result array
                                                       -> Ptr (Ptr Word16)  -- ^ Result (array of keys)
                                                       -> CString           -- ^ Result (key series)
                                                       -> IO Word16
-- | FreeMemory
foreign import stdcall "FreeMemory" c_Free_Memory :: forall a. Ptr a -> IO ()

-- * Open keys storage manipulation
-- | SprList
foreign import stdcall "SprList" c_SprList :: CString
                                           -> CString
                                           -> Ptr (Ptr C_SprList)
                                           -> Ptr Word16
                                           -> Word8
                                           -> IO Word16

{-#LANGUAGE DeriveDataTypeable#-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Bindings.Verba.C.Types
-- Copyright   :  (c) Macil 2014
-- License     :  PublicDomain
-- 
-- Maintainer  :  Macil.dev@gmail.com
-- Stability   :  experimental
-- Portability :  unportable
--
-- FFI types and instances
--
-----------------------------------------------------------------------------
module Bindings.Verba.C.Types where

import Control.Applicative

import Data.ByteString (ByteString, packCString)
import Data.Typeable (Typeable)

import Foreign

-- | USR_KEYS_INFO        
data C_USR_KEYS_INFO = C_USR_KEYS_INFO {
                                         _c_num  :: ByteString
                                                  -- ^ Encryption key number
                                       , _c_nump :: ByteString
                                                  -- ^ Signature key number
                                       , _c_key_status :: Word16
                                       , _c_ver_hi :: Word8
                                                  -- ^ Version high byte
                                       , _c_ver_lo :: Word8
                                                  -- ^ Version low byte
                                       , _c_slot_no :: Word32
                                                  -- ^ Slot number
                                       } deriving (Eq, Show, Typeable)
-- | Check_Status
data C_Check_Status =
    C_Check_Status {
                     _c_name :: ByteString
                                -- ^ Key number
                   , _c_alias :: ByteString
                                -- ^ Key alias
                   , _c_position :: Word8
                   , _c_status :: Word8
                   , _c_date :: Word32
                   } deriving (Eq, Show, Typeable)

-- | SprList
data C_SprList = C_SprList { _key_id :: ByteString
                           , _key_type :: Word8
                           , _key_status :: Word8
                           } deriving (Eq, Show, Typeable)

instance Storable C_USR_KEYS_INFO where
    sizeOf _ = 32
    alignment _ = 4
    peek ptr =
        C_USR_KEYS_INFO <$> (packCString . castPtr $ ptr )
                        <*> (packCString $ ptr `plusPtr` 11)
                        <*> (peekByteOff ptr 24)
                        <*> (peekByteOff ptr 26)
                        <*> (peekByteOff ptr 27)
                        <*> (peekByteOff ptr 28)

instance Storable C_Check_Status where
    sizeOf _ = 140
    alignment _ = 4
    peek ptr =
        C_Check_Status <$> (packCString . castPtr $ ptr)
                       <*> (packCString $ ptr `plusPtr` 13)
                       <*> (peekByteOff ptr 134)
                       <*> (peekByteOff ptr 135)
                       <*> (peekByteOff ptr 136)

instance Storable C_SprList where
    sizeOf _ = 15
    alignment _ = 4
    peek ptr =
        C_SprList <$> (packCString . castPtr $ ptr)
                  <*> (peekByteOff ptr 13)
                  <*> (peekByteOff ptr 14)

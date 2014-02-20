{-#LANGUAGE DeriveDataTypeable#-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Bindings.Verba.ErrorCodes
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
module Bindings.Verba.ErrorCodes where

import Data.Typeable (Typeable)

data VerbaError = VerbaError Int String String deriving (Eq, Show, Typeable)

verr :: Int -> VerbaError
verr   0 = VerbaError   0 "NO_ERROR"             "Нет ошибки. Функция завершилась успешно"
verr   1 = VerbaError   1 "E_NO_MEM"             "Не хватает динамической памяти"
verr   2 = VerbaError   2 "E_CONTROL"            "Сбой криптографической функции или искажение тела библиотеки"
verr   3 = VerbaError   3 "E_DRIVER"             "Ошибка датчика случайных чисел"
verr   4 = VerbaError   4 "E_IMMITO"             "Не совпадает имитовставка - файл (блок памяти) искажен"
verr   6 = VerbaError   6 "E_KEY_NOT_FOUND"      "Ключ не найден (или искажен)"
verr   7 = VerbaError   7 "E_PARAM"              "Ошибка параметра обращения к функции"
verr   8 = VerbaError   8 "E_INIT"               "Ошибка инициализации"
verr  10 = VerbaError  10 "E_MEM_LENGTH"         "Неверная длина блока памяти"
verr  11 = VerbaError  11 "E_MEM_NOT_ENCRYPTED"  "Попытка расшифровать незашифрованный блок памяти"
verr  12 = VerbaError  12 "E_MEM_NOT_SIGNED"     "Попытка проверить подпись неподписанного блока памяти"
verr  21 = VerbaError  21 "E_OPEN_IN_FILE"       "Ошибка открытия входного файла"
verr  22 = VerbaError  22 "E_OPEN_OUT_FILE"      "Ошибка открытия выходного файла"
verr  23 = VerbaError  23 "E_WRITE_FILE"         "Ошибка записи файла"
verr  24 = VerbaError  24 "E_READ_FILE"          "Ошибка чтения файла"
verr  25 = VerbaError  25 "E_RENAME_FILE"        "Ошибка переименования файла"
verr  26 = VerbaError  26 "E_FILE_LENGTH"        "Неверная (например, нулевая) длина файла"
verr  27 = VerbaError  27 "E_SRC"                "Несовпадение контрольной суммы зашифрованного файла"
verr  29 = VerbaError  29 "E_FILE_NOT_ENCRYPTED" "Попытка расшифрования незашифрованного файла"
verr  30 = VerbaError  30 "E_FILE_NOT_SIGNED"    "Попытка проверки подписи неподписанного файла"
verr  31 = VerbaError  31 "E_SEEK"               "Ошибка смещения файлового указателя"
verr  32 = VerbaError  32 "E_CLOSE"              "Ошибка закрытия файла"
verr  33 = VerbaError  33 "E_DELETE_FILE"        "Ошибка удаления файла"
verr  34 = VerbaError  34 "E_GK"                 "Ошибка при чтении GK"
verr  35 = VerbaError  35 "E_KC"                 "Ошибка при чтении KC"
verr  36 = VerbaError  36 "E_DEVICE"             "Ошибка при обращении к сменному ключевому устройству"
verr  37 = VerbaError  37 "E_REDEFINE"           "Попытка перезаписи ключа в драйвер ASYNCR"
verr  38 = VerbaError  38 "E_NO_FREE_SLOTS"      "В драйвере ASYNCR нет свободных \"слотов\""
verr  39 = VerbaError  39 "E_KEY_NOT_SET"        "Ошибка при загрузке ключа в драйвер ASYNCR"
verr 101 = VerbaError 101 "ERR_NUMP"             "Номер ключа NUM или NUMP не соответствует считанному из драйвера Asyncr"
verr 102 = VerbaError 102 "ERR_HASH"             "Значение хэш-функции не совпало"
verr 103 = VerbaError 103 "ERR_OPEN_SPR"         "Ошибка при открытии файла со справочником открытых ключей"
verr 104 = VerbaError 104 "ERR_OPEN_IMM"         "Ошибка при открытии файла с имитовставками"
verr 105 = VerbaError 105 "ERR_UZ"               "Ошибка чтения UZ"
verr 106 = VerbaError 106 "ERR_CKD"              "Ошибка чтения CKD или CKDI"
verr 107 = VerbaError 107 "ERR_IMM_SPR"          "Длина файла со справочником не соответствует длине файла с имитовставками"
verr 108 = VerbaError 108 "ERR_READ_SPR"         "Ошибка чтения файла со справочником открытых ключей"
verr 109 = VerbaError 109 "ERR_WRITE_SPR"        "Ошибка записи в файл со справочником открытых ключей"
verr 110 = VerbaError 110 "ERR_READ_IMM"         "Ошибка чтения файла с имитовставками"
verr 111 = VerbaError 111 "ERR_IMM"              "Имитовставка неверна"
verr 112 = VerbaError 112 "ERR_COMPROM"          "Открытый ключ скомпрометирован"
verr 113 = VerbaError 113 "ERR_CRE_DIR"          "Ошибка при создании каталога"
verr 114 = VerbaError 114 "ERR_CRE_FILE"         "Ошибка при создании файла *.imm, *.imp, или *.spr"
verr 115 = VerbaError 115 "ERR_EXIST_SPR"        "В заданном каталоге уже существует файл *.spr"
verr 116 = VerbaError 116 "ERR_WRITE_IMM"        "Ошибка записи в файл имитовставок"
verr 117 = VerbaError 117 "ERR_NO_KEY"           "Указанный открытый ключ отсутствует в справочнике"
verr 118 = VerbaError 118 "ERR_LENGTH"           "Неверная длина файла *.imm, *.imp, или *.spr"
verr 119 = VerbaError 119 "ERR_OPEN_TMP"         "Ошибка открытия временного файла"
verr 120 = VerbaError 120 "ERR_SPR_EMPTY"        "Справочник открытых ключей пуст"
verr 121 = VerbaError 121 "ERR_KEY_HEAD"         "Заголовок открытого ключа искажен"
verr 122 = VerbaError 122 "ERR_FIND_SPR"         "Справочник открытых ключей не найден"
verr 123 = VerbaError 123 "ERR_NO_RES"           "Открытый ключ не является резервным"
verr 124 = VerbaError 124 "ERR_IMM_HEAD"         "Заголовок файла с имитовставками искажен"
verr 125 = VerbaError 125 "ERR_NO_SIGN"          "Нет имитовставки на открытый ключ"
verr 126 = VerbaError 126 "ERR_NO_IMM"           "Нет имитовставки на открытый ключ"
verr 127 = VerbaError 127 "ERR_FLOP"             "Ошибка при обращении к гибкому диску"
verr unk = VerbaError unk ("_E_UNK" ++ (show unk)) ("Неизвестная ошибка (код " ++ show unk ++ ")")

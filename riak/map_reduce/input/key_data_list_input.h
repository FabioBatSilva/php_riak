/*
   Copyright 2013: Kaspar Bach Pedersen

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/


#ifndef RIAK_MAP_REDUCE__INPUT__KEY_DATA_LIST_INPUT__H__
#define RIAK_MAP_REDUCE__INPUT__KEY_DATA_LIST_INPUT__H__

#include "php_riak_internal.h"

void riak_map_reduce_input_key_data_list_input_init(TSRMLS_D);

PHP_METHOD(Riak_MapReduce_Input_KeyDataListInput, __construct);
PHP_METHOD(Riak_MapReduce_Input_KeyDataListInput, getValue);
PHP_METHOD(Riak_MapReduce_Input_KeyDataListInput, add);


#endif //RIAK_MAP_REDUCE__INPUT__KEY_DATA_LIST_INPUT__H__


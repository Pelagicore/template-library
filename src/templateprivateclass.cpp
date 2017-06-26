/*
 *   Copyright (C) 2017 Pelagicore AB
 *
 *   This Source Code Form is subject to the terms of the Mozilla Public
 *   License, v. 2.0. If a copy of the MPL was not distributed with this
 *   file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 *   SPDX-License-Identifier: MPL-2.0
 *
 */

#include "templateprivateclass.h"

#include <iostream>

TemplatePrivateClass::TemplatePrivateClass()
{
    std::cout << "TemplatePrivateClass::TemplatePrivateClass()\n";
}

TemplatePrivateClass::~TemplatePrivateClass()
{
    std::cout << "TemplatePrivateClass::~TemplatePrivateClass()\n";
}

void TemplatePrivateClass::templateFunction()
{
    std::cout << "TemplatePrivateClass::function()\n";
}

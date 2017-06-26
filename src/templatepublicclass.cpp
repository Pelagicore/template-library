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

#include "templatepublicclass.h"
#include "templateprivateclass.h"

#include <iostream>

TemplatePublicClass::TemplatePublicClass() :
    templatePrivateInstance(new TemplatePrivateClass)
{
    std::cout << "TemplatePublicClass::TemplatePublicClass()\n";
}

TemplatePublicClass::~TemplatePublicClass()
{
    std::cout << "TemplatePublicClass::~TemplatePublicClass()\n";
}

void TemplatePublicClass::templateFunction()
{
    templatePrivateInstance->templateFunction();
}

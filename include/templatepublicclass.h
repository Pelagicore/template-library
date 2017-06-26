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

#ifndef TEMPLATEPUBLICCLASS_H_
#define TEMPLATEPUBLICCLASS_H_

#include <memory>

class TemplatePrivateClass;

class TemplatePublicClass
{
public:
    TemplatePublicClass();
    ~TemplatePublicClass();

    void templateFunction();

protected:

private:
    std::shared_ptr<TemplatePrivateClass> templatePrivateInstance;
};

#endif // TEMPLATEPUBLICCLASS_H_

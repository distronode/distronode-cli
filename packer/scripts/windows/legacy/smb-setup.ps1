# Copyright DistroNode Contributors
# SPDX-License-Identifier: Apache-2.0
#
# The DistroNode Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# Windows Enable SMB1
Enable-WindowsOptionalFeature -Online -FeatureName smb1protocol -NoRestart

# Windows 2016 Setups 
Set-SmbServerConfiguration -EnableSMB1Protocol $true -Confirm:$true -Force

# Windows7, Windows2008, WindowsVista
set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters SMB1 -Type DWORD -Value 1 -Force
Restart-Service lanmanserver

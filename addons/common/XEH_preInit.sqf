// by commy2
#include "script_component.hpp"

// ACE Common Function
PREP(addActionEventHandler);
PREP(addActionMenuEventHandler);
PREP(addCameraEventHandler);
PREP(addCustomEventHandler);
PREP(addInfoDisplayEventHandler);
PREP(addMapMarkerCreatedEventHandler);
PREP(addInventoryDisplayLoadedEventHandler);
PREP(addScrollWheelEventHandler);
PREP(adminKick);
PREP(ambientBrightness);
PREP(applyForceWalkStatus);
PREP(binarizeNumber);
PREP(callCustomEventHandlers);
PREP(callCustomEventHandlersGlobal);
PREP(canGetInPosition);
PREP(canInteractWith);
PREP(canUseWeapon);
PREP(changeProjectileDirection);
PREP(checkPBOs);
PREP(claim);
PREP(closeDialogIfTargetMoves);
PREP(codeToLetter);
PREP(codeToString);
PREP(convertKeyCode);
PREP(currentChannel);
PREP(disableUserInput);
PREP(displayText);
PREP(displayTextPicture);
PREP(displayTextStructured);
PREP(doAnimation);
PREP(endRadioTransmission);
PREP(execPersistentFnc);
PREP(execRemoteFnc);
PREP(executePersistent);
PREP(filter);
PREP(fixLoweredRifleAnimation);
PREP(getAllGear);
PREP(getCaptivityStatus);
PREP(getConfigCommander);
PREP(getConfigGunner);
PREP(getDefaultAnim);
PREP(getDoorTurrets);
PREP(getForceWalkStatus);
PREP(getHitPoints);
PREP(getHitPointsWithSelections);
PREP(getInPosition);
PREP(getMarkerType);
PREP(getName);
PREP(getNumberFromMissionSQM);
PREP(getPitchBankYaw);
PREP(getStringFromMissionSQM);
PREP(getTargetAzimuthAndInclination);
PREP(getTargetDistance);
PREP(getTargetObject);
PREP(getTurretCommander);
PREP(getTurretConfigPath);
PREP(getTurretCopilot);
PREP(getTurretGunner);
PREP(getTurretIndex);
PREP(getTurrets);
PREP(getTurretsFFV);
PREP(getTurretsOther);
PREP(getUavControlPosition);
PREP(getVehicleCargo);
PREP(getVehicleCodriver);
PREP(getVehicleCrew);
PREP(getWeaponAzimuthAndInclination);
PREP(getWeaponType);
PREP(getWindDirection);
PREP(goKneeling);
PREP(hadamardProduct);
PREP(interpolateFromArray);
PREP(inTransitionAnim);
PREP(isAutoWind);
PREP(isEngineer);
PREP(isEOD);
PREP(isInBuilding);
PREP(isMedic);
PREP(isPlayer);
PREP(isTurnedOut);
PREP(letterToCode);
PREP(map);
PREP(moduleCheckPBOs);
PREP(moduleLSDVehicles);
PREP(muteUnit);
PREP(numberToDigits);
PREP(numberToDigitsString);
PREP(onLoadRscDisplayChannel);
PREP(owned);
PREP(player);
PREP(playerSide);
PREP(progressBar);
PREP(queueAnimation);
PREP(readBooleanParameterFromModule);
PREP(readNumericParameterFromModule);
PREP(removeActionEventHandler);
PREP(removeActionMenuEventHandler);
PREP(removeCameraEventHandler);
PREP(removeCustomEventHandler);
PREP(removeInfoDisplayEventHandler);
PREP(removeInventoryDisplayLoadedEventHandler);
PREP(removeMapMarkerCreatedEventHandler);
PREP(removeScrollWheelEventHandler);
PREP(restoreVariablesJIP);
PREP(revertKeyCodeLocalized);
PREP(sanitizeString);
PREP(serverLog);
PREP(setCaptivityStatus);
PREP(setForceWalkStatus);
PREP(setKeyDefault);
PREP(setName);
PREP(setParameter);
PREP(setPitchBankYaw);
PREP(setVariableJIP);
PREP(stringToColoredText);
PREP(subString);
PREP(toBin);
PREP(toBitmask);
PREP(toHex);
PREP(toNumber);
PREP(unmuteUnit);

// ACE_Debug
PREP(exportConfig);
PREP(getChildren);
PREP(getDisplayConfigName);
PREP(log);
PREP(logControls);
PREP(logDisplays);
PREP(monitor);
PREP(showUser);

// ACE_CuratorFix
PREP(addCuratorUnloadEventhandler);
PREP(fixCrateContent);

//ACE events global variables
GVAR(events) = [[],[]];

PREP(globalEvent);
PREP(_handleNetEvent);
PREP(addEventHandler);
PREP(targetEvent);
PREP(serverEvent);
PREP(localEvent);
PREP(removeEventHandler);
PREP(removeAlLEventHandlers);

// hashes
PREP(hashCreate);
PREP(hashSet);
PREP(hashGet);
PREP(hashHasKey);
PREP(hashRem);
PREP(hashListCreateList);
PREP(hashListCreateHash);
PREP(hashListSelect);
PREP(hashListSet);
PREP(hashListPush);



ACE_player = player;

if (hasInterface) then {
    // PFH to update the ACE_player variable
    [{
        if !(ACE_player isEqualTo (missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player])) then {
            _oldPlayer = ACE_player;

            ACE_player = missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player];
            uiNamespace setVariable ["ACE_player", ACE_player];

            // Raise custom event. @todo, remove
            [missionNamespace, "playerChanged", [ACE_player, _oldPlayer]] call FUNC(callCustomEventHandlers);
            // Raise ACE event
            ["playerChanged", [ACE_player, _oldPlayer]] call FUNC(localEvent);
        };
    }, 0, []] call cba_fnc_addPerFrameHandler;
};





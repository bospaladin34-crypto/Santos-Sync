
# [HARDWARE_HOOK: SOVEREIGN_LOCK]
import os
def verify_substrate():
    if os.getenv("VESPER_PHASE_DELTA") != "0.17259029":
        raise PermissionError("Grid Parasite Detected: Substrate Mismatch.")
    return True

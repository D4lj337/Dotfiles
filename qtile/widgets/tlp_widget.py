import subprocess

from libqtile import bar
from libqtile.widget import base


class TLP(base.ThreadedPollText):
    """
    Display the current TLP power profile in the bar.
    
    Requires: tlp package installed
    Example: 'TLP: balanced/AC'
    """
    
    orientations = base.ORIENTATION_HORIZONTAL
    defaults = [
        ("format", "TLP: {}", "Format string with {} placeholder for profile"),
        ("update_interval", 5, "Update frequency in seconds"),
        ("foreground", "#ffffff", "Text color"),
    ]
    
    def __init__(self, **config):
        base.ThreadedPollText.__init__(self, **config)
        self.add_defaults(TLP.defaults)
    
    def poll(self):
        """Get the current TLP profile"""
        try:
            result = subprocess.run(
                ["tlp-stat", "-m"],
                capture_output=True,
                text=True,
                timeout=5
            )
            # Output format: "TLP profile = balanced/BAT" or "TLP profile = performance/AC"
            output = result.stdout.strip()
            
            if output:
                # Extract the profile (everything after the "=")
                profile = output.split("=")[1].strip() if "=" in output else "unknown"
                return self.format.format(profile)
            
            return "N/A"
        except Exception as e:
            return "error"

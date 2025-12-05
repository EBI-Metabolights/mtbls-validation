import enum

from pydantic import BaseModel


class PolicyMessageType(str, enum.Enum):
    ERROR = "ERROR"
    WARNING = "WARNING"
    INFO = "INFO"
    SUCCESS = "SUCCESS"


class Violation(BaseModel):
    rule_id: str = ""
    title: str = ""
    description: str = ""
    type: PolicyMessageType = PolicyMessageType.INFO
    section: str = ""
    priority: str = ""

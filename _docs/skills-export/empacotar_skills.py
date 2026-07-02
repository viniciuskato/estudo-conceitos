"""
Empacota as skills do projeto como arquivos .skill (ZIP).
Execute com duplo clique ou: python empacotar_skills.py
Os arquivos .skill serao gerados nesta mesma pasta.

Skills geradas:
  - compendio.skill
  - mecanismo.skill
  - compendio-medicina-basica.skill
  - compendio-medicina-clinica.skill
  - compendio-investimentos.skill
  - compendio-ia.skill
  - compendio-filosofia.skill
  - compendio-fisica.skill
  - mecanismo-medicina-basica.skill
  - mecanismo-medicina-clinica.skill
  - autocritica-sessao.skill

Instalacao: Settings > Capabilities > Skills no Claude desktop.
"""
import zipfile
from pathlib import Path

script_dir = Path(__file__).parent

skills = [
    "compendio",
    "mecanismo",
    "compendio-medicina-basica",
    "compendio-medicina-clinica",
    "compendio-investimentos",
    "compendio-ia",
    "compendio-filosofia",
    "compendio-fisica",
    "mecanismo-medicina-basica",
    "mecanismo-medicina-clinica",
    "autocritica-sessao",
]

for skill in skills:
    skill_dir = script_dir / skill
    if not skill_dir.exists():
        print(f"AVISO: pasta nao encontrada -- {skill_dir}")
        continue

    output_file = script_dir / f"{skill}.skill"
    with zipfile.ZipFile(output_file, "w", zipfile.ZIP_DEFLATED) as zf:
        for file in skill_dir.rglob("*"):
            if file.is_file():
                arcname = file.relative_to(skill_dir.parent)
                zf.write(file, arcname)

    print(f"Criado: {output_file.name}")

print("Pronto! Instale cada .skill via Settings > Capabilities > Skills.")

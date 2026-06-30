"""
Empacota as skills do projeto como arquivos .skill (ZIP).
Execute com duplo clique ou: python empacotar_skills.py
Os arquivos .skill serão gerados nesta mesma pasta.

Skills geradas:
  - atlas.skill              (skill estrutural — mapas de campo)
  - mecanismo.skill          (skill estrutural — compêndios de mecanismo)
  - atlas-medicina-basica.skill
  - atlas-medicina-clinica.skill
  - atlas-investimentos.skill
  - mecanismo-medicina-basica.skill
  - mecanismo-medicina-clinica.skill

Instalação: Settings > Capabilities > Skills no Claude desktop.
"""
import zipfile
from pathlib import Path

script_dir = Path(__file__).parent

skills = [
    "atlas",
    "mecanismo",
    "atlas-medicina-basica",
    "atlas-medicina-clinica",
    "atlas-investimentos",
    "mecanismo-medicina-basica",
    "mecanismo-medicina-clinica",
    "autocritica-sessao",
]

for skill in skills:
    skill_dir = script_dir / skill
    if not skill_dir.exists():
        print(f"AVISO: pasta não encontrada — {skill_dir}")
        continue

    output_file = script_dir / f"{skill}.skill"
    with zipfile.ZipFile(output_file, "w", zipfile.ZIP_DEFLATED) as zf:
        for file in skill_dir.rglob("*"):
            if file.is_file():
                arcname = file.relative_to(skill_dir.parent)
                zf.write(file, arcname)

    print(f"Criado: {output_file.name}")

print("\nPronto! Instale cada .skill via Settings > Capabilities > Skills.")
input("Pressione Enter para fechar...")

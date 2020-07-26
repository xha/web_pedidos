<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Perfil
 * 
 * @property int $idPerfil
 * @property string|null $descripcion
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Menu[] $menus
 * @property Collection|Usuario[] $usuarios
 *
 * @package App\Models
 */
class Perfil extends Model
{
	protected $table = 'perfil';
	protected $primaryKey = 'idPerfil';
	public $timestamps = false;

	protected $casts = [
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function menus()
	{
		return $this->belongsToMany(Menu::class, 'perfil_menu', 'idPerfil', 'idMenu')
					->withPivot('esLector', 'esEscritor', 'esBorrador', 'fechaCreacion', 'idEmpresa', 'estado', 'activo');
	}

	public function usuarios()
	{
		return $this->hasMany(Usuario::class, 'idPerfil');
	}
}

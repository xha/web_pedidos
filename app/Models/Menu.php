<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Menu
 * 
 * @property int $idMenu
 * @property string|null $descripcion
 * @property string|null $ruta
 * @property int $idPadre
 * @property string|null $accion
 * @property string|null $icon
 * @property Carbon $fechaCreacion
 * @property bool $activo
 * @property bool|null $visible
 * @property string|null $orden
 * 
 * @property Collection|Perfil[] $perfils
 *
 * @package App\Models
 */
class Menu extends Model
{
	protected $table = 'menu';
	protected $primaryKey = 'idMenu';
	public $timestamps = false;

	protected $casts = [
		'idPadre' => 'int',
		'activo' => 'bool',
		'visible' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'ruta',
		'idPadre',
		'accion',
		'icon',
		'fechaCreacion',
		'activo',
		'visible',
		'orden'
	];

	public function perfils()
	{
		return $this->belongsToMany(Perfil::class, 'perfil_menu', 'idMenu', 'idPerfil')
					->withPivot('esLector', 'esEscritor', 'esBorrador', 'fechaCreacion', 'idEmpresa', 'estado', 'activo');
	}
}
